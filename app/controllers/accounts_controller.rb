class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  # before_action :user_is_admin, except: [:show]
  # GET /accounts
  # GET /accounts.json


  def new_deposit
    @account = Account.find(params[:id])
  end
  def create_deposit
    
    @account = Account.find(params[:id])
    if deposit_params[:amount].to_f > 1000
      flash.alert = "Deposit more than a thousand in same day is not allowed "
      render :new_deposit
    else
      if @account.deposit(deposit_params)
        flash[:notice] = "Transaction completed Successfully"
        if deposit_params[:amount].to_f >= 800.0 && deposit_params[:amount].to_f <= 1000.0 
            Email.alert(@account,deposit_params[:amount].to_f,session[:atm_no]).deliver
        end
        Transaction.create!(amount: deposit_params[:amount] , debit: true ,account_id: @account.id,atm_mach_id: session[:atm_no])
        redirect_to  atm_mach_path(session[:atm_no])
      else
        flash.alert = @account.errors.full_messages.to_sentence
        render :new_deposit
      end
    end
  end
  

  def new_withdrawal
    @account = Account.find(params[:id])
  end
  def create_withdrawal
    @account = Account.find(params[:id])
    if  withdrawal_params[:amount].to_f> 500
      flash.alert = "Withdrawal more than a $500 in same day not allowed "
      render :new_withdrawal
    else
      if @account.withdrawal(withdrawal_params)
        flash[:notice] = "Transaction completed Successfully"
        if deposit_params[:amount].to_f >= 400.0 && deposit_params[:amount].to_f <= 500.0 
            Email.alert(@account,deposit_params[:amount].to_f*-1,session[:atm_no]).deliver
        end
        Transaction.create!(amount: deposit_params[:amount] , debit: false ,account_id: @account.id,atm_mach_id: session[:atm_no])
        redirect_to atm_mach_path(session[:atm_no])
      else
        flash.alert = @account.errors.full_messages.to_sentence
        render :new_withdrawal
      end
    end
  end
  

  def select_transaction 
  end
 
  def transaction_list
    @account = Account.find(params[:id])
    @transactions = @account.transactions
    @transaction = @account.transactions
  
        pdf = TransactionsList.new(@transactions)
  
    respond_to do |format|
      format.html
      format.pdf do
        send_data pdf.render , filename: 'transactions_list.pdf', type:'application/pdf', disposition: "inline"
      end
    end
  end
 


  def index
    @accounts = Account.all
  end
  
  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end
  
  # GET /accounts/new
  def new
    @account = Account.new
    session[:atm_no] = params[:atm_no] 
  end
  
  # GET /accounts/1/edit
  def edit
    session[:atm_no] = params[:atm_no] 
  end
  
  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @atm_no = params[:atm_no] 
    respond_to do |format|
      if @account.save
        format.html { redirect_to atm_mach_path(session[:atm_no])}
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to edit_user_info_path(session[:user_info_no]) }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    #def user_is_admin
      #unless current_user.admin
       # flash[:error] = "Access denyed "
        #redirect_to root_path
      #end
    #end
  
  # Use callbacks 
  def set_account
    @account = Account.find(params[:id])
  end
  
  
  def account_params
    params.require(:account).permit(:balance, :account_number, :user_id, :active)
  end
  
  def deposit_params
    params.require(:account).permit(:amount)
  end
  
  def withdrawal_params
    params.require(:account).permit(:amount)
  end
end
