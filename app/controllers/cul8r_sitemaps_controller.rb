class Cul8rSitemapsController < SitemapsController
  skip_before_filter :authenticate_user!
end