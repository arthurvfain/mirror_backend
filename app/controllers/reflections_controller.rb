class ReflectionsController < ApplicationController

    
    def create
        o = reflection_params[:or].to_i - reflection_params[:ol].to_i
        c = reflection_params[:cr].to_i - reflection_params[:cl].to_i
        e = reflection_params[:er].to_i - reflection_params[:el].to_i
        a = reflection_params[:ar].to_i - reflection_params[:al].to_i
        n = reflection_params[:nr].to_i - reflection_params[:nl].to_i
        reflection = Reflection.create!(user_id: reflection_params[:user], mirror_id: reflection_params[:mirror], o: o, c: c, e: e, a: a, n: n )
        if reflection.valid?
            render json: {reflection: reflection}, status: :created
        else
            render json: {errors: reflection.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def show
        user = User.find_by(id: params[:id])
        if user 
            reflections = Reflection.where(user_id: params[:id]).pluck(:o, :c, :e, :a, :n)
            reflection = reflections.transpose.map { |row| row.inject(&:+) / reflections.transpose[0].size}
            render json: reflection, status: :ok
        else
            head :no_content
        end
    end

    def generate
        reflection_criteria = {'or': ['Inventive', 'Curious'], 'ol': ['Consistent', 'Cautious'], 'cr': ['Efficient', 'Organized'], 'cl': ['Easy-Going', 'Careless'], 'er': ['Outgoing', 'Energetic'], 'el': ['Solitary', 'Reserved'], 'ar': ['Friendly', 'Compassionate'], 'al': ['Challenging', 'Detached'], 'nr': ['Sensitive', 'Nervous'], 'nl': ['Secure', 'Confident']}
        processed_criteria = {'or': reflection_criteria[:or].sample, 'ol': reflection_criteria[:ol].sample, 'cr': reflection_criteria[:cr].sample, 'cl': reflection_criteria[:cl].sample, 'er': reflection_criteria[:er].sample, 'el': reflection_criteria[:el].sample, 'ar': reflection_criteria[:ar].sample, 'al': reflection_criteria[:al].sample, 'nr': reflection_criteria[:nr].sample, 'nl': reflection_criteria[:nl].sample} 
        render json: processed_criteria, status: :ok
    end

    # def destroy
    #     reflection = Reflection.find_by
    # end

    def reflection_params
        params.permit(:or, :ol, :cr, :cl, :er, :el, :ar, :al, :nr, :nl, :user, :mirror)
    end
end
