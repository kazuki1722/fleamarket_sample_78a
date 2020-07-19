crumb :root do
  link "ホームへ", root_path
end

# 商品一覧ページ
crumb :item_show do |item|
  link item.name, item_path(item.id)
  parent :root
end

# マイページ
crumb :mypage do
  link "マイページ", mypages_path
  parent [:root, :item_show]
end

# 検索
# crumb :category do
#   link "カテゴリ一覧", "#"
#   parent :root
# end

# crumb :category_child do |child|
#   link child, "#"
#   # parent :category_parent
# end

# crumb :category_grandchild do |grandchild|
#   link grandchild, "#"
#   parent :category_child
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).