class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!
  before_action :set_wedding
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.where(wedding_id: @wedding.id)
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    is_part_of_wedding?(current_user, @wedding)
    @expense = Expense.new(expenses_params)
    @expense.wedding_id = @wedding.id
    if @expense.save
      flash[:notice] = "Expense created successfully"
      redirect_to wedding_expenses_url(@wedding)
    else
      flash[:error] = @expense.errors
    end
  end

  def update
    if @expense.update(expenses_params)
      flash[:notice] = "Expense updated susccessfully"
      redirect_to wedding_expenses_url(@wedding)
    else
      flash[:error] = @expense.errors
    end
  end

  def destroy
    if @expense.destroy
      flash[:notice] = "Expense deleted"
      redirect_to wedding_expenses_url(@wedding)
    else
      flash[:error] = @expense.errors
    end
  end

  private
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expenses_params
    params.require(:expense).permit(:name, :price, :wedding_id)
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
    is_part_of_wedding?(current_user, @wedding)
  end


end
