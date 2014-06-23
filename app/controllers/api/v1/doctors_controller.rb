module Api
  module V1
    class DoctorsController < ApplicationController
      include ActionController::ImplicitRender
      include ActionController::MimeResponds
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
    end
  end
end
