module ApplicationHelper

  def render_errors(
    errors,
    prohibiting: 'action from being completed',
    heading_type: :h2
  )
    err_count = pluralize(errors.count, "error")
    heading_content = "#{err_count} prohibited this #{prohibiting}:"

    render(
      partial: 'shared/errors',
      locals: {
        errors: errors,
        heading_content: heading_content,
        heading_type: heading_type
      }
    )
  end

end
