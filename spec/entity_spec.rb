describe ActiveInteractor::Entity do
  describe "#initialize" do
    it 'should create entity' do
      object = ActiveInteractor::Entity.new(1)
      expect(object).not_to be_nil
    end
  end

  describe '#==' do
    let(:first_object) { ActiveInteractor::Entity.new(1) }
    let(:second_object) { ActiveInteractor::Entity.new(1) }

    it 'objects with the same id are equal' do
      expect(first_object).to eq(second_object)
    end
  end

  describe '#to_h' do
    let(:object) { ActiveInteractor::Entity.new(1) }

    subject { object.to_h }

    it 'should create hash of params' do
      expect(subject).to have_key(:id)
      expect(subject).to eq({id: 1})
    end
  end
end
