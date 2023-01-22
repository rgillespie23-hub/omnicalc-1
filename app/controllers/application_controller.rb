class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square

    @num = params.fetch("bro").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/random_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root

    @number = params.fetch("user_number").to_f
    @sqaure_root_of_number = @number ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @number_of_years = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f
    @r = @apr/12/100
    @n = @number_of_years*12
    @numerator = @r*@principal
    @denominator = (1 - ((1 + @r)**(-1*@n)))
    @payment = (@numerator / @denominator).round(2)
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end
