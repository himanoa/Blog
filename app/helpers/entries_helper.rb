module EntriesHelper
  def text_clamp(str)
    str.slice(0, 139) + '…'
  end
end
