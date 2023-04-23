require "test_helper"

class OperationTest < ActiveSupport::TestCase
  
  test "return true if operation valid" do
    new_operation = Operation.new(amount: 10, odate: '2023-02-04', description: "some text", otype: 0, category_id: categories(:one).id)
    assert(new_operation.valid?)
  end
  
  test "sum_by_category checks result" do
    start_date = '2022-06-01'
    end_date = '2023-02-14'
    result = Operation.sum_by_category(start_date, end_date)

    assert_equal(10, result.size)
    assert_equal(100, result[categories(:one).name])
    assert_equal(200, result[categories(:two).name])
    assert_equal(300, result[categories(:three).name])
    assert_equal(400, result[categories(:four).name])
    assert_equal(500, result[categories(:five).name])
    assert_equal(600, result[categories(:six).name])
    assert_equal(700, result[categories(:seven).name])
    assert_equal(800, result[categories(:eight).name])
    assert_equal(900, result[categories(:nine).name])
    assert_equal(1000, result[categories(:ten).name])
    
  end

  test "sum_by_date checks result" do
    start_date = '2022-06-01'
    end_date = '2023-02-14'
    result = {Date.new(2022, 6, 4)=>1000, Date.new(2022, 7, 4)=>900, Date.new(2022, 8, 4)=>800, Date.new(2022, 9, 4)=>700, Date.new(2022, 10, 4)=>600, Date.new(2022, 11, 4)=>900, Date.new(2022, 12, 4)=>300, Date.new(2023, 1, 4)=>200, Date.new(2023, 2, 4)=>100}
    assert_equal(result, Operation.sum_by_dates(start_date, end_date))
  end

  test "expenses from begining of the month" do
    result = {Date.new(2023, 2, 4) => 100}
    assert_equal(result, Operation.expens_from_begin_month)
  end

  test "income from begining of the month" do
    result = Operation.income_from_begin_month
    assert_equal(1300, result)
  end
end
