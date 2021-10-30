require 'json'

def hello(event:, context:)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end

def calculator(event:, context:)
  operator = event['operator']
  success = false
  result = 0
  case operator
  when 'add'
    result = event['lhs']+event['rhs']
    success = true
  when 'subtract'
    result = event['lhs']-event['rhs']
    success = true
  when 'multiply'
    result = event['lhs']*event['rhs']
    success = true
  end
  if(success)
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