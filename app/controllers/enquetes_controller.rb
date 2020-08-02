class EnquetesController < ApplicationController
  before_action :authenticate_user!, except: [:pagina_inicial]
  before_action :habilitado?, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :set_enquete, only: [:show, :edit, :update, :destroy]

  # GET /enquetes
  # GET /enquetes.json
  def index
    @enquetes = Enquete.all
  end

  def pagina_inicial
  end

  def classificacao
    @enquete = Enquete.last
    @primeiro = @enquete.vencedor
    opcaos = @enquete.opcaos
    @opcoes = opcaos.order(:pontos).reverse_order
  end

  # GET /enquetes/1
  # GET /enquetes/1.json
  def show
  end

  # GET /enquetes/new
  def new
    @enquete = Enquete.new
    @enquete.opcaos.build
  end

  # GET /enquetes/1/edit
  def edit
  end

  # POST /enquetes
  # POST /enquetes.json
  def create
    @enquete = Enquete.new(enquete_params)

    respond_to do |format|
      if @enquete.save
        format.html { redirect_to @enquete, notice: 'Enquete criada com sucesso!' }
        format.json { render :show, status: :created, location: @enquete }
      else
        format.html { render :new }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquetes/1
  # PATCH/PUT /enquetes/1.json
  def update
    respond_to do |format|
      if @enquete.update(enquete_params)
        format.html { redirect_to @enquete, notice: 'Enquete editada com sucesso!' }
        format.json { render :show, status: :ok, location: @enquete }
      else
        format.html { render :edit }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquetes/1
  # DELETE /enquetes/1.json
  def destroy
    @enquete.destroy
    respond_to do |format|
      format.html { redirect_to enquetes_url, notice: 'Enquete removida com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquete
      @enquete = Enquete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquete_params
      params.require(:enquete).permit(:titulo, :descricao, opcaos_attributes: [:id, :nome, :_destroy])
    end

    def habilitado?
      if current_user.admin != true
        redirect_to pagina_inicial_enquetes_path, notice: "Você não tem permissão para acessar esta página!"
      end  
    end
end
