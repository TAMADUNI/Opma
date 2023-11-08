RSpec.describe "User sessions ", type: :request do
    describe "POST /users/sign_in" do
        let(:user) { create(:user, email: "test@example.com", password: "123")}

        it 'Signs in with valid email and password' do 
        end
    end
end