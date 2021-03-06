
# Copied to app from Pulitzer install

class RootController < ApplicationController


	include Pulitzer::Concerns::RootConcern

	# this is the homepage!
	def index
 @articles = Pulitzer::Article.published.order( created_at: :desc ).limit( 15 )

@promo = Promo.where( active: true ).first
		render layout: 'application'
	end

	# this handles all media in the pulitzer_media table
	def show

		# get_pulitzer_media is a wrapper on friendly_id that also
		# handles special cases such as the sitemap & handling redirects
		return unless get_pulitzer_media( params[:id] )

		# pulitzer_render renders while handling custom layouts/views
		# via media.layout and media.template
		pulitzer_render( @media )
	end

	def wod
		@media = Pulitzer::Article.published.order( created_at: :desc ).limit( 1 ).first
		render @media.template, layout: @media.layout
	end




	# route additional static pages not edited via wysiwyg here
	# e.g.
	# route '/about', to: 'root#about'
	# then here
	# def about
	# 	pull data required for about page.....
	# end

end
