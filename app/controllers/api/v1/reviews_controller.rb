module Api
    module V1
        class ReviewsController < ApplicationController
            def create
                review = Review.new(create_params)
                if review.save
                    review_id = review[:id]
                    for tag in create_tag_params[:tags].split(",")
                        tag = Tag.new("review_id":review_id, "title":tag)
                        if !tag.save
                            render json: {status: 'ERROR_REVIEW', data: tag.error}
                            break
                        end
                    end
                    render json: { status: 'SUCCESS'}
                else
                    render json: {status: 'ERROR_REVIEW', data: review.error}
                end
                
            end

            def show
                review = Review.find(show_params[:id].to_i())
                tags = Tag.where("review_id": show_params[:id].to_i())
                render json: { status: 'SUCCESS', message: 'Loaded the post', data: { review: review, tags: tags } }
            end

            def showList
                limit = showList_params[:limit].to_i() 
                offset = (showList_params[:page].to_i() - 1) * limit
                categories = showList_params[:categories].split(",")
                review_ids = Tag.where(title: categories).limit(limit).offset(offset).pluck(:review_id)

                reviews = Review.find(review_ids)
                render json: { status: 'SUCCESS', message: 'Loaded the post', reviews: reviews } 
            end

            def create_params
                params.permit(:account_id, :title, :content)
            end

            def create_tag_params
                params.permit(:tags)
            end

            def show_params
                params.permit(:id)
            end

            def showList_params
                params.permit(:categories, :page, :limit)
            end


        end
    end
end
