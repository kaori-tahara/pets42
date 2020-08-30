class DogLove < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '犬大好き！動物大好き！' },
    { id: 3, name: '犬は好き！' },
    { id: 4, name: '犬に興味あり！' }
  ]
end
