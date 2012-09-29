require 'spec_helper'

describe RelationshipsController do
	
	let(:user) { FactoryGirl.create(:user)}
	let(:other_user) { FactoryGirl.create(:user)}

	before { sign_in user}

	describe "creating a relationship with Ajax" do

		it "should increment the Relationship count" do
			expect do
				xhr :post, :create,  relationship: { followed_id: other_user.id }
			end.should change(Relationship, :count).by(1)
		end

		it "should respond with success" do
			xhr :post, :create, relationship: { followed_id: other.id }
			response.should be_success
		end
		
	end

	describe "destroying a relationship with Ajax" do

		before { user.follow!(other_user)}
		let(:relationship) { user.relationshios. find_by_follow_id(other_user)}
		it "should decrement the Relationship count" do
			expect do
				xhr :post, :creat, relationship: { followed_id: other_user.id}
				response.should be_success
			end
		end
	end
	
end