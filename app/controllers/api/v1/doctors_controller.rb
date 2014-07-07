module Api
  module V1
    class DoctorsController < ApplicationController
      include ActionController::ImplicitRender
      include ActionController::MimeResponds
      before_filter :allow_cross_domain_access
      respond_to :json
      
      def index
        if params.include?("name")
          search = params["name"].titleize
          @doctors = Doctor.where("name like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          @doctors = Doctor.where("specialty like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          @doctors = Doctor.where("medical_group like ?", "%#{search}%")
          respond_with @doctors
        else
          @doctors = Doctor.all
          respond_with @doctors
        end
      end

      def cchp
        if params.include?("name")
          search = params["name"].titleize
          @doctors = Doctor.cchp.where("name like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          @doctors = Doctor.cchp.where("specialty like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          @doctors = Doctor.cchp.where("medical_group like ?", "%#{search}%")
          respond_with @doctors
        else
          @doctors = Doctor.cchp
          respond_with @doctors
        end
      end

      def blue_cross
        if params.include?("name")
          search = params["name"].titleize
          @doctors = Doctor.blue_cross.where("name like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          @doctors = Doctor.blue_cross.where("specialty like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          @doctors = Doctor.blue_cross.where("medical_group like ?", "%#{search}%")
          respond_with @doctors
        else
          @doctors = Doctor.blue_cross
          respond_with @doctors
        end
      end

      def blue_shield
        if params.include?("name")
          search = params["name"].titleize
          @doctors = Doctor.blue_shield.where("name like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          @doctors = Doctor.blue_shield.where("specialty like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          @doctors = Doctor.blue_shield.where("medical_group like ?", "%#{search}%")
          respond_with @doctors
        else
          @doctors = Doctor.blue_shield
          respond_with @doctors
        end
      end

      def kaiser
        if params.include?("name")
          search = params["name"].titleize
          @doctors = Doctor.kaiser.where("name like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          @doctors = Doctor.kaiser.where("specialty like ?", "%#{search}%")
          respond_with @doctors
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          @doctors = Doctor.kaiser.where("medical_group like ?", "%#{search}%")
          respond_with @doctors
        else
          @doctors = Doctor.kaiser
          respond_with @doctors
        end
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
