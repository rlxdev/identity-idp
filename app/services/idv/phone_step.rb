module Idv
  class PhoneStep < Step
    def submit
      if complete?
        update_idv_session
      else
        idv_session.vendor_phone_confirmation = false
      end

      FormResponse.new(success: complete?, errors: errors)
    end

    private

    def complete?
      vendor_validation_passed?
    end

    def update_idv_session
      idv_session.vendor_phone_confirmation = true
      idv_session.address_verification_mechanism = :phone
      idv_session.params = idv_form_params
      idv_session.user_phone_confirmation = idv_form_params[:phone_confirmed_at].present?
    end
  end
end
