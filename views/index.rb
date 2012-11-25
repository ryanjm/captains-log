class App
  module Views
    class Index < Layout
      include ViewHelpers

      attr_accessor :life_logs
    end
  end
end
