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
          doctors = Doctor.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.all
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end

      def cchp
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.cchp.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.cchp.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.cchp
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end

      def blue_cross
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.blue_cross_PPO_and_EPO.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.blue_cross_PPO_and_EPO.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.blue_cross_PPO_and_EPO.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.blue_cross_PPO_and_EPO
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end

      def blue_cross_HMO
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.blue_cross_HMO.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.blue_cross_HMO.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.blue_cross_HMO.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.blue_cross_HMO
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end

      def blue_shield_PPO
        binding.pry
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.blue_shield_PPO.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.blue_shield_PPO.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.blue_shield_PPO.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.blue_shield_PPO
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end

      def blue_shield_EPO
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.blue_shield_EPO.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.blue_shield_EPO.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.blue_shield_EPO.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.blue_shield_EPO
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        end
      end      

      def kaiser_HMO
        if params.include?("name")
          search = params["name"].titleize
          doctors = Doctor.kaiser_HMO.where("name like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("specialty")
          search = params["specialty"].titleize
          doctors = Doctor.kaiser_HMO.where("specialty like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        elsif params.include?("medicalgroup")
          search = params["medicalgroup"].titleize
          doctors = Doctor.kaiser_HMO.where("medical_group like ?", "%#{search}%")
          respond_with doctors, :except => [:id, :created_at, :updated_at]
        else
          doctors = Doctor.kaiser_HMO
          respond_with doctors, :except => [:id, :created_at, :updated_at]
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
