import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(this.element, {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: false,
      slidesPerView: 3,
      spaceBetween: 50,
      loop: true,
      coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      onSlideChange: () => { console.log('lololol')}
    });
    swiper.on('slideChange', (e) => {
      e.slides.forEach((slide) => { slide.querySelector('video').pause() })
    })
  }

  displayControls(event) {
    console.log(event)
    if (
      this.element.parentElement.classList.contains("swiper-slide-next")
    ) {
      this.element.firstElementChild.setAttribute('controls', 'controls')
    }
  }

  removeControls(event) {
    this.element.firstElementChild.removeAttribute('controls')

  }
}
