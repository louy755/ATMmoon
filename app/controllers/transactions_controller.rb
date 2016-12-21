class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    
  
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    
  session[:atm_no] = params[:atm_no] 
  end

  # GET /transactions/1/edit
  def edit
    
  session[:atm_no] = params[:atm_no] 
    
    
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
       @atm_no = params[:atm_no] 
      if @transaction.save
       format.html { redirect_to atm_mach_path(session[:atm_no])}
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    
     
    
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    
    def transaction_params
      params.require(:transaction).permit(:amount, :merchent_name, :debit, :account_id ,:user_id)
    end
end
