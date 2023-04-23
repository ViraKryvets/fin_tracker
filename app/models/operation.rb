class Operation < ApplicationRecord
  belongs_to :category
    
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :odate, presence: true
  # validates :otype, presence: true
  validates :description, presence: true
  
  enum :otype, {expenses: 0, income: 1}, default: :expenses

  paginates_per 15


  def self.sum_by_category(start_date, end_date)
    Operation.joins(:category).where(otype:"0").where("odate BETWEEN ? AND ?", start_date, end_date).group("categories.id, categories.name").sum(:amount)  
  end

  def self.sum_by_dates(start_date, end_date)
    Operation.where(otype:"0").where("odate BETWEEN ? AND ?", start_date, end_date).group("odate").sum(:amount)
  end

  def self.expens_from_begin_month
    Operation.where(otype:"0").where("odate BETWEEN ? AND ?", Date.today.at_beginning_of_month, Time.now).group("odate").sum(:amount)
  end

  def self.income_from_begin_month
    Operation.where(otype:"1").where("odate BETWEEN ? AND ?", Date.today.at_beginning_of_month, Time.now).sum(:amount)
  end

end
