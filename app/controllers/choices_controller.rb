class ChoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :habilitado?, only: [:index, :show, :edit, :update, :destroy]   
  before_action :set_choice, only: [:show, :edit, :update, :destroy]

  # GET /choices
  # GET /choices.json
  def index
    @choices = Choice.all
  end

  # GET /choices/1
  # GET /choices/1.json
  def show
  end

  # GET /choices/new
  def new
    escolhas = current_user.choices
    escolhas.each do |escolha|
      if escolha.opcao.enquete == Enquete.last
        redirect_to pagina_inicial_enquetes_path, notice: "Você já votou nesta enquete!"
      end
    end
    @choice = Choice.new
    @enquete = Enquete.last
    @opcoes = @enquete.opcaos
  end

  # GET /choices/1/edit
  def edit
  end

  # POST /choices
  # POST /choices.json
  def create
    @choice = Choice.new(choice_params)

    respond_to do |format|
      @choice.user = current_user
      if @choice.save
        format.html { redirect_to pagina_inicial_enquetes_path, notice: 'Seu voto foi computado com sucesso!' }
        format.json { render :show, status: :created, location: @choice }
      else
        @enquete = Enquete.last
        @opcoes = @enquete.opcaos
        format.html { render :new }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /choices/1
  # PATCH/PUT /choices/1.json
  def update
    respond_to do |format|
      if @choice.update(choice_params)
        format.html { redirect_to @choice, notice: 'Choice was successfully updated.' }
        format.json { render :show, status: :ok, location: @choice }
      else
        format.html { render :edit }
        format.json { render json: @choice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.json
  def destroy
    @choice.destroy
    respond_to do |format|
      format.html { redirect_to choices_url, notice: 'Choice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_choice
      @choice = Choice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def choice_params
      params.require(:choice).permit(:opcao_id, :user_id)
    end

    def habilitado?
      if current_user.admin != true
        redirect_to pagina_inicial_enquetes_path, notice: "Você não tem permissão para acessar esta página!"
      end  
    end
end
