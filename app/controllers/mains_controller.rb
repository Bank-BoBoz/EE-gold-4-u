class MainsController < ApplicationController
  # GET /mains
  # GET /mains.xml
  def index
    @mains = Main.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mains }
    end
  end

  # GET /mains/1
  # GET /mains/1.xml
  def show
    @main = Main.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @main }
    end
  end

  # GET /mains/new
  # GET /mains/new.xml
  def new
    @main = Main.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @main }
    end
  end

  # GET /mains/1/edit
  def edit
    @main = Main.find(params[:id])
  end

  # POST /mains
  # POST /mains.xml
  def create
    @main = Main.new(params[:main])

    respond_to do |format|
      if @main.save
        format.html { redirect_to(@main, :notice => 'Main was successfully created.') }
        format.xml  { render :xml => @main, :status => :created, :location => @main }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @main.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mains/1
  # PUT /mains/1.xml
  def update
    @main = Main.find(params[:id])

    respond_to do |format|
      if @main.update_attributes(params[:main])
        format.html { redirect_to(@main, :notice => 'Main was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @main.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1
  # DELETE /mains/1.xml
  def destroy
    @main = Main.find(params[:id])
    @main.destroy

    respond_to do |format|
      format.html { redirect_to(mains_url) }
      format.xml  { head :ok }
    end
  end

  def whyUS

  end

  def rate

  end

  def how

  end

  def about

  end

  def faq

  end

  def soon

  end
end
