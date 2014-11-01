class ProConsController < GroupBaseController

  # before_filter :we_dont_serve_images_here_google_bot
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :load_resource_by_key, except: [:new, :create, :index]
  authorize_resource :except => [:new, :create, :index, :add_comment]

  rescue_from ActiveRecord::RecordNotFound do
    render 'application/display_error', locals: { message: t('error.not_found') }
  end

  def new
    @pro_con = ProCon.new
    @pro_con.user = current_user
  end

  def edit

    logger.info ">>>>>>>>>>>>>>>> edit"


    # p = ProCon.last

    # s = p.smiles.create({user_id: current_user.id})


  end

  def minus
    logger.info "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--------Minus"
  end

  def plus_smile
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
    logger.info "+++++++++++++++++++++++++++++";
  end

  def update

    logger.info ">>>>>>>>>>>>>>>> update"

    if DiscussionService.edit_discussion(current_user, permitted_params.discussion, @discussion)
      flash[:notice] = 'Discussion was successfully updated.'
      redirect_to @discussion
    else
      @user_groups = current_user.groups.order('name')
      render :edit
    end
  end

  def create

    logger.info ">>>>>>>>>>>>>>>> create"
    logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2 #{session[:return_to].inspect}"
    discussion = current_user.discussions.find(session[:return_to][:discussion])

    @pro_cons = ProCon.new(pro_con_params)
    @pro_cons.discussion_id = discussion.id

    @pro_cons.save!

    logger.info ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2 #{discussion.inspect}"

    redirect_to session[:return_to][:url]
    session[:return_to] = nil


    return


    #
  end

  def destroy

    logger.info ">>>>>>>>>>>>>>>> destroy"

    @discussion.delayed_destroy
    flash[:success] = t("success.discussion_deleted")
    redirect_to @discussion.group
  end

  def index
    @pro_cons = ProCon.all
  end

  def show
  end

  def add_comment

    logger.info ">>>>>>>>>>>>>>>> add_comment"

    build_comment
    if DiscussionService.add_comment(@comment)
      current_user.update_attributes(uses_markdown: params[:uses_markdown])
      respond_to do |format|
        format.js
        format.html { redirect_to discussion_path(@discussion) }
      end
    else
      head :ok and return
    end
  end

  private

  def we_dont_serve_images_here_google_bot

    logger.info ">>>>>>>>>>>>>>>> we_dont_serve_images_here_google_bot"


    if request.format == :png
      render :text => 'Not Found', :status => '404'
    end
  end

  def load_resource_by_key
    @pro_cons ||= ProCon.find(params[:id])
  end

  def build_comment

    @comment = Comment.new(body: params[:comment],
                           uses_markdown: params[:uses_markdown])

    attachment_ids = Array(params[:attachments]).map(&:to_i)

    @comment.discussion = @discussion
    @comment.author = current_user
    @comment.attachment_ids = attachment_ids
    @comment.attachments_count = attachment_ids.size
    @comment
  end

  def pro_con_params
    params.require(:pro_con).permit(:body, :cons)
  end

end
