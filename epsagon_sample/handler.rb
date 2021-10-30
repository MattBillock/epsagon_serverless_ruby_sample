require 'json'

def calculator(event:, context:)
  operator = event['operator']
  lhs = event['lhs']
  rhs = event['rhs']

  result = case operator
    when 'add' then lhs+rhs
    when 'subtract' then lhs-rhs
    when 'multiply' then lhs*rhs
    else 'INVALID'
  end
  if(result != 'INVALID')
    {
      statusCode: 200,
      body: {
        result: result
      }.to_json
    }
  else
    {
      statusCode: 500,
      body: {
        message: 'The operation was invalid',
        input: event
      }.to_json
    }
  end
end