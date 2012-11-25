class App
  module Views
    class Show < Layout
      include ViewHelpers
      attr_accessor :life_log
    end
  end
end
