defmodule Terrible.Commanded do
  @moduledoc """
  Main module to use the Commanded library.

  Commanded is a library that makes it easy to build
  applications that follow the CQRS/ES pattern.

  See:
    - https://github.com/commanded/commanded
    - http://cqrs.nu/Faq
  """

  use Commanded.Application, otp_app: :terrible

  router(Terrible.CommandedRouter)
end
