# frozen_string_literal: true

# :nodoc:
class GraphqlController < ApplicationController
  def execute
    result = if params[:_json]
               FiveFoodSchema.multiplex(batching_queries, context: context)
             else
               FiveFoodSchema.execute(
                 params[:query],
                 variables: ensure_hash(params[:variables]),
                 context: context
               )
             end
    render json: result
  end

  private

  # TODO: Provide context
  def context
    {}
  end

  def batching_queries
    params.require(:_json).map { |query| format_query(query) }
  end

  def format_query(params)
    query = params.permit(:query, variables: {})
    query = query.to_h.symbolize_keys
    query[:variables] = ensure_hash(query[:variables])
    query
  end

  # Handle form data, JSON body, or a blank value
  # rubocop:disable Metrics/MethodLength
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
