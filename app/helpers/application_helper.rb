module ApplicationHelper
  def default_meta_tags
    {
      site: 'Camplan',
      title: 'Camplan',
      reverse: true,
      charset: 'utf-8',
      description: "キャンプ計画アプリ",
      keywords: 'キャンプ,キャンプアプリ,キャンプギア',
      canonical: request.original_url,
      separator: '|', # これで　"タイトル | サイトネーム"ってなる
      icon: [
        { href: image_url('top_background.jpg') },
        { href: image_url('top_background.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('top_background.jpg'),
        local: 'ja-JP',
      },
        twitter: {
        card: 'summary_large_image',
        image: image_url('top_background.jpg'),
          }
        }
  end
end
