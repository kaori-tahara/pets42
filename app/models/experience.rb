class Experience < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '飼育経験あり' },
    { id: 3, name: '飼育経験は無いが、遊んだり世話の経験あり' },
    { id: 4, name: '飼育経験無し' }
  ]
end

