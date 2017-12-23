describe ActiveInteractor::Context do
  describe "#initialize" do
    let(:params) { {id: 2, name: 'myString'} }

    subject { ActiveInteractor::Context.new(params) }

    it 'should create context with all passed data' do
      expect(subject.data).to eq(params)
    end

    it 'should create methods for passed data' do
      expect(subject.name).to eq(params[:name])
      expect(subject.id).to eq(params[:id])
    end
  end
end
