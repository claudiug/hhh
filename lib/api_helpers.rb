require 'multi_json'
require 'oj'

module ApiHelpers
  def json_error(code, message)
    error = {
        code: code,
        message: message
    }
    halt(code, json(error))
  end

  def json(hash)
    content_type :json
    ::MultiJson.dump(hash, pretty: true)
  end

  def record_not_found(params, field)
    json_error(404, "Record not found: #{field} => #{params}")
  end

  def invalid_params(fields)
    json_error(422, "Invalid data for fields: #{fields.join(', ')}")
  end

  def delete_response
    204
  end


end