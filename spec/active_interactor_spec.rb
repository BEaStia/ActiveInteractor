RSpec.describe ActiveInteractor do
  it "has a version number" do
    expect(ActiveInteractor::VERSION).not_to be nil
  end

  it "loads all objects" do
    expect(ActiveInteractor::constants).to include(:Entity, :VERSION, :Operation, :ValueObject)
  end
end
