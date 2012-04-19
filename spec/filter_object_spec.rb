require 'spec_helper'

describe FilterObject::Filter do
  class FilterObjectTestClass
    include FilterObject::Filter
  end

  subject { FilterObjectTestClass.new }

  let(:controller) { stub }

  it { should respond_to(:filter) }

  describe "#filter" do
    let(:filter_object) { FilterObjectTestClass.new }

    def run_filter
      filter_object.filter controller
    end

    it "configures the filter's controller" do
      expect { filter_object.filter controller }.to change { filter_object.controller }.to controller
    end

    context "#params delegation" do
      before do
        def filter_object.filter(controller)
          super
          params
        end
      end

      it "delegates calls to #params to the controller" do
        controller.should_receive(:params)
        run_filter
      end
    end

    context "#request delegation" do
      before do
        def filter_object.filter(controller)  
          super
          request
        end
      end

      it "delegates calls to #request to the controller" do
        controller.should_receive(:request)
        run_filter
      end
    end

    context "#flash delegation" do
      before do
        def filter_object.filter(controller)
          super
          flash
        end
      end

      it "delegates calls to #flash to the controller" do
        controller.should_receive(:flash)
        run_filter
      end
    end

    context "#redirect_to delegation" do
      before do
        def filter_object.filter(controller)
          super
          redirect_to
        end
      end

      it "delegates calls to #redirect_to to the controller" do
        controller.should_receive(:redirect_to)
        run_filter
      end
    end

    context "#render delegation" do
      before do
        def filter_object.filter(controller)  
          super
          render
        end
      end

      it "delegates calls to #render to the controller" do
        controller.should_receive(:render)
        run_filter
      end
    end

    context "#session delegation" do
      before do
        def filter_object.filter(controller)
          super
          session
        end
      end

      it "delegates calls to #session to the controller" do
        controller.should_receive(:session)
        run_filter
      end
    end

    context "#headers delegation" do
      before do
        def filter_object.filter(controller)
          super
          headers
        end
      end

      it "delegates calls to #headers to the controller" do
        controller.should_receive(:headers)
        run_filter
      end
    end

    context "#cookies delegation" do
      before do
        def filter_object.filter(controller)
          super
          cookies
        end
      end

      it "delegates calls to #cookies to the controller" do
        controller.should_receive(:cookies)
        run_filter
      end
    end
  end
end
