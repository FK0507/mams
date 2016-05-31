module ApplicationHelper

 # 選択中のサイドメニューのクラスを返す
  def sidebar_activate(sidebar_link_url)
    current_url = request.headers['PATH_INFO']
    if current_url.match(sidebar_link_url)
      ' class="active"'
    else
      ''
    end
  end

  # サイドメニューの項目を出力する
  def sidebar_list_items
    items = [
      {:text => 'ユーザー情報',      :path => 'root_path'},
      {:text => '企業情報',   :path => 'root_path'}
    ]

    html = ''
    items.each do |item|
      text = item[:text]
      path = item[:path]
      html = html + %Q(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
    end

    raw(html)
  end
  
  def current_company
    if current_user.kind == "buyer" then
      @current_company = current_user.buyers[0] #ログインユーザーに紐づくbuyer
      @opponent_company = @current_company.sellers #ログインユーザーのbuyerに紐づくsellerの配列
    elsif current_user.kind == "seller" then
      @current_company = current_user.sellers[0] #ログインユーザーに紐づくseller
      @opponent_company = @current_company.buyers #ログインユーザーのsellerに紐づくbuyerの配列
    end 
  end

end
