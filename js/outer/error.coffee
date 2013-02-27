CI.outer.Error = class Error extends CI.outer.Page
  constructor: ->
    @name = "error"
    @status = renderContext.status or 404
    @url = renderContext.githubPrivateAuthURL
    @useStickyFooter = true

  title: =>
    titles =
      401: "Login required"
      404: "Page not found"
      500: "Internal server error"

    titles[@status] or "Something unexpected happened"

  message: =>
    messages =
      401: "<a href=\"#{@url}\">You must <b>log in</b> to view this page.</a>"
      404: "We're sorry, but that page doesn't exist."
      500: "We're sorry, but something broke."
    messages[@status] or "Something completely unexpected happened"

  viewContext: =>
    title: @title()
    error: @status
    message: @message()
