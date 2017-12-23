describe ActiveInteractor::Operation do

  class ExampleOperation < ActiveInteractor::Operation

    validate :id, :custom_validation
    validate :id, 'ExampleValidation'

    def custom_validation(*args)
      object = args.first
      object.context.id == nil
    end

    def exec(args = {})
      context.id = args[:id]
      context.new_id = 2
      context
    end
  end

  class ExampleValidation
    def validate(*args)
      object = args.first
      object.context.id == nil
    end
  end

  describe "#initialize" do
    subject { ExampleOperation.new }

    it 'should create context' do
      expect(subject.context).not_to be_nil
      expect(subject.context.success?).to be_truthy
    end
  end

  describe '#call' do
    subject { ExampleOperation.new.call(id: 1)}

    it 'should work' do
      expect(subject.success?).to be_truthy
      expect(subject.new_id).to eq(2)
    end
  end
end
