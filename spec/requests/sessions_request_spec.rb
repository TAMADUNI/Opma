RSpec.describe "User sessions ", type: :request do
    describe "POST /users/sign_in" do
        let(:user) { create(:user, email: "test@example.com", password: "123")}

        it 'Signs in with valid email and password' do
            post user_session_path, params: { user: { email: user.email, password: user.password } } 
            expect(response).to redirect_to(root_path)
            follow_redirect!
            expect(response.body).to include("Signed in successfully.")
        end
    end
end