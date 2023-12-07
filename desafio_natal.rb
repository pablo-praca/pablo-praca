# app/models/presente.rb
class Presente < ApplicationRecord
    has_one :destinatario
    validates :nome, :descricao, presence: true
  end
  
  # app/controllers/presentes_controller.rb
  class PresentesController < ApplicationController
    before_action :set_presente, only: [:show, :edit, :update, :destroy]
  
    # GET /presentes
    def index
      @presentes = Presente.all
    end
  
    # GET /presentes/1
    def show
    end
  
    # GET /presentes/new
    def new
      @presente = Presente.new
    end
  
    # GET /presentes/1/edit
    def edit
    end
  
    # POST /presentes
    def create
      @presente = Presente.new(presente_params)
  
      if @presente.save
        redirect_to @presente, notice: 'Presente was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /presentes/1
    def update
      if @presente.update(presente_params)
        redirect_to @presente, notice: 'Presente was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /presentes/1
    def destroy
      @presente.destroy
      redirect_to presentes_url, notice: 'Presente was successfully destroyed.'
    end
  
    private
      # Use callbacks para compartilhar configurações ou restrições comuns entre ações.
      def set_presente
        @presente = Presente.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Presente not found' }, status: :not_found
      end
  
      # Permitir a passagem de apenas um parametro confiável "white list".
      def presente_params
        params.require(:presente).permit(:nome, :descricao)
      end
  end



