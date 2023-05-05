module ChaptersHelper
  def chapter_leader_card(chapter)
    leader = UsersChapter.find_by(chapter_id: chapter.id, leader: true).user
    image_tag = image_tag("https://github.com/#{leader.github_username}.png", size: "207x97")
    name = UsersChapter.find_by_chapter(chapter.id)

    content_tag(:div, class: "bg-gray-100 rounded-md shadow-md overflow-hidden inline-block") do
      content_tag(:div, class: "h-48") do
        image_tag
      end +
        content_tag(:div, class: "bg-gray-200 px-4 py-2 my-4") do
          content_tag(:p, name, class: "text-gray-800 font-bold") +
            content_tag(:p, leader.github_username)
        end
    end
  end
end
