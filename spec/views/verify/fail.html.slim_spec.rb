require 'rails_helper'

describe 'verify/fail.html.slim' do
  let(:view_context) { ActionController::Base.new.view_context }

  context 'when SP is present' do
    before do
      sp = build_stubbed(:service_provider, friendly_name: 'Awesome Application!')
      @decorated_session = ServiceProviderSessionDecorator.new(
        sp: sp, view_context: view_context, sp_session: {}, service_provider_request: nil
      )
      allow(view).to receive(:decorated_session).and_return(@decorated_session)
    end

    it 'displays the hardfail4 partial' do
      render

      expect(view).to render_template(partial: 'verify/_hardfail4')
      expect(rendered).to have_content(
        t('idv.messages.hardfail4', sp: @decorated_session.sp_name)
      )
    end
  end

  context 'when SP is not present' do
    before do
      allow(view).to receive(:decorated_session).and_return(SessionDecorator.new)
    end

    it 'displays the null partial' do
      render

      expect(view).to render_template(partial: 'shared/_null')
    end
  end
end
