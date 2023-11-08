RSpec.describe "User sessions ", type: :request do
    describe "POST /users/sign_in" do
        let(:user) { create(:user, email: "test@example.com", password: "123")}

        it 'Signs in with valid email and password' do
            post user_session_path, params: { user: { email: user.email, password: user.password } } 
            expect(response).to redirect_to(root_path)
            follow_redirect!
            expect(response.body).to include("Signed in successfully.")
        end

        it 'fails to sign in with invalid password' do
            post user_session_path, params: { user: { email: user.email, password: "1234" } }
            expect(response.body).to include("Invalid Email or password.")
            expect(response).to render_template(:new)
        end

        it 'fails to sign in with invalid email' do
            post user_session_path, params: { user: { email: "nonexist@email.com", password: "123"}}
            expect(response.body).to include("Invalid Email or password.")
            expect(response).to render_template(:new)
        end

    end
end