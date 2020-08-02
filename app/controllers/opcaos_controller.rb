class OpcaosController < ApplicationController
  before_action :authenticate_user!
  before_action :habilitado?
  before_action :set_opcao, only: [:show, :edit, :update, :destroy]

  # GET /opcaos
  # GET /opcaos.json
  def index
    @opcaos = Opcao.all
  end

  # GET /opcaos/1
  # GET /opcaos/1.json
  def show
  end

  # GET /opcaos/new
  def new
    @opcao = Opcao.new
  end

  # GET /opcaos/1/edit
  def edit
  end

  # POST /opcaos
  # POST /opcaos.json
  def create
    @opcao = Opcao.new(opcao_params)

    respond_to do |format|
      if @opcao.save
        format.html { redirect_to @opcao, notice: 'Opção criada com sucesso!' }
        format.json { render :show, status: :created, location: @opcao }
      else
        format.html { render :new }
        format.json { render json: @opcao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opcaos/1
  # PATCH/PUT /opcaos/1.json
  def update
    respond_to do |format|
      if @opcao.update(opcao_params)
        format.html { redirect_to @opcao, notice: 'Opcao atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @opcao }
      else
        format.html { render :edit }
        format.json { render json: @opcao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opcaos/1
  # DELETE /opcaos/1.json
  def destroy
    @opcao.destroy
    respond_to do |format|
      format.html { redirect_to opcaos_url, notice: 'Opção Apagada com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opcao
      @opcao = Opcao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opcao_params
      params.require(:opcao).permit(:nome, :enquete_id)
    end

    def habilitado?
      if current_user.admin != true
        redirect_to pagina_inicial_enquetes_path, notice: "Você não tem permissão para acessar esta página!"
      end  
    end
end
