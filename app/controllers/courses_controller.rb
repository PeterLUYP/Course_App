class CoursesController < ApplicationController
	
	def index
		@courses = Course.all
		if params[:title].present?
		@courses = @courses.where("title like ?", "%#{params[:title]}%")
	end
		if params[:Teacher].present?
		@courses = @courses.where("Teacher like ?", "%#{params[:Teacher]}%")
	end
		if params[:place].present?
		@courses = @courses.where("place like ?", "%#{params[:place]}%")
	end
		if params[:time].present?
		@courses = @courses.where("time like ?", "%#{params[:time]}%")
	end
		if params[:credit].present?
		@courses = @courses.where("credit like ?", "%#{params[:credit]}%")
	end
	end

	def show
		@course = Course.find(params[:id])
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to root_path
		else
			render :new
	                end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			redirect_to root_path
		else
			redirect_to :edit
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to root_path
	end

	private

	def course_params
		params.require(:course).permit(:title, :Teacher, :place, :time, :credit)
	end
end
