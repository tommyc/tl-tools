# frozen_string_literal: true

module DirUtils
  def dir_list(dir)
    Dir.glob(dir).map(&File.method(:realpath))
  end

  def file_list(filter)
    Dir.glob("*.#{filter}").map(&File.method(:realpath))
  end
end
