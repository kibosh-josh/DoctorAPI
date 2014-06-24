module Api
  module V1
    class DoctorsController < ApplicationController
      include ActionController::ImplicitRender
      include ActionController::MimeResponds
      before_filter :allow_cross_domain_access
      respond_to :json
      
      def index
        @doctors = Doctor.all
        respond_with @doctors
      end

      def cchp
        @doctors = Doctor.cchp
        respond_with @doctors
      end

      def blue_cross
        @doctors = Doctor.blue_cross
        respond_with @doctors
      end

      def blue_shield
        @doctors = Doctor.blue_shield
        respond_with @doctors
      end

      def kaiser
        @doctors = Doctor.kaiser
        respond_with @doctors
      end

      def allow_cross_domain_access
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
        headers['Access-Control-Max-Age'] = '1728000'
      end 
    end
  end
end
