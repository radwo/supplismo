require 'spec_helper.rb'

module Supplismo
  describe 'Authentiaction' do
    let(:password) { 'passwd' }
    let(:session) { {admin: false } }
    let(:auth) { Authentication.new(password, session) }
    subject{auth}
    describe '#authenticate' do
      specify 'with correct password' do
        subject.authenticate(password)
        session[:admin].should be_true
      end
      specify 'with wron password' do
        subject.authenticate('wrong')
        session[:admin].should be_false
      end
    end

    describe '#valid_password?' do
      specify 'with correct password' do
        subject.valid_password?(password).should be_true
      end
      specify 'with wron password' do
        subject.valid_password?('wrong').should be_false
      end
    end

    describe '#admin?' do
      specify 'with admin set to true' do
        auth = Authentication.new(password, {admin: true})
        auth.admin?.should be_true
      end
      specify 'with admin set to false' do
        auth = Authentication.new(password, {admin: false})
        auth.admin?.should be_false
      end
      specify 'without admin in session' do
        auth = Authentication.new(password, {})
        auth.admin?.should be_false
      end
    end

    describe '#destroy' do
      specify {
        auth = Authentication.new(password, {admin: true})
        auth.admin?.should be_true
        auth.destroy.should be_true
        auth.admin?.should be_false
      }
    end
  end
end
