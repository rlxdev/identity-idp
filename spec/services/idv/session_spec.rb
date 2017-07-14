require 'rails_helper'

describe Idv::Session do
  let(:user) { build(:user) }
  let(:user_session) { {} }

  subject { Idv::Session.new(user_session: user_session, current_user: user, issuer: nil) }

  describe '#method_missing' do
    it 'disallows un-supported attributes' do
      expect { subject.foo = 'bar' }.to raise_error NoMethodError
    end

    it 'allows supported attributes' do
      Idv::Session::VALID_SESSION_ATTRIBUTES.each do |attr|
        subject.send attr, 'foo'
        expect(subject.send(attr)).to eq 'foo'
        subject.send "#{attr}=".to_sym, 'foo'
        expect(subject.send(attr)).to eq 'foo'
      end
    end
  end

  describe '#respond_to_missing?' do
    it 'disallows un-supported attributes' do
      expect(subject.respond_to?(:foo=, false)).to eq false
    end

    it 'allows supported attributes' do
      Idv::Session::VALID_SESSION_ATTRIBUTES.each do |attr|
        expect(subject.respond_to?(attr, false)).to eq true
        expect(subject.respond_to?("#{attr}=".to_sym, false)).to eq true
      end
    end
  end

  describe '#complete_session' do
    context 'with phone verifed by vendor' do
      before do
        subject.address_verification_mechanism = :phone
        subject.phone_confirmation = true
      end

      context 'having completed OTP phone confirmation' do
        before do
          subject.params['phone_confirmed_at'] = Time.zone.now
        end

        it 'completes the user profile' do
          allow(subject).to receive(:complete_profile)
          subject.complete_session
          expect(subject).to have_received(:complete_profile)
        end
      end

      context 'not having completed OTP phone confirmation' do
        before do
          subject.params.delete('phone_confirmed_at')
        end

        it 'does not complete the user profile' do
          allow(subject).to receive(:complete_profile)
          subject.complete_session
          expect(subject).not_to have_received(:complete_profile)
        end
      end
    end
  end
end
