class CurrenciesController < ApplicationController
  def forex
    @sym_data = open("https://api.exchangerate.host/symbols").read
    @sym_array = JSON.parse(@sym_data).fetch("symbols").keys

    render({ :template => "currency_templates/step_one.html.erb" })
  end

  def from_curr
    @sym_data = open("https://api.exchangerate.host/symbols").read
    @sym_array = JSON.parse(@sym_data).fetch("symbols").keys
    @from_sym = params.fetch("from_curr")
    render({ :template => "currency_templates/step_two.html.erb" })
  end

  def to_curr
    @from_sym = params.fetch("from_curr")
    @to_sym = params.fetch("to_curr")
    @url = "https://api.exchangerate.host/convert?from=" + @from_sym + "&to=" + @to_sym
    @data = open(@url).read
    @rate = JSON.parse(@data).fetch("info").fetch("rate")

    render({ :template => "currency_templates/step_three.html.erb" })
  end
end
