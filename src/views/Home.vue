<template>
  <div class="home">
    <h1>Hi!</h1>
    <h2>Mein Name ist Jonas Donker, Freelancer für Webentwicklung und Design aus dem Raum Köln.</h2>
    <div class="row">
      <div class="v-card" @click="setTurned">
        <figure :class="[viewType, turned ? 'turned' : '']" figure-role="group">
          <figcaption v-if="!turned" class="head">
            <div class="bold">Jonas Donker</div>
            <div class="light">Webentwickler & Designer</div>
          </figcaption>
          <figcaption class="quote" v-if="activeQuote && !turned">
            <div class="bold">{{ activeQuote.text }}</div>
            <div class="light">- {{ activeQuote.author }}</div>
          </figcaption>
          <figcaption v-if="turned" ref="contact" class="contact">
            <div class="bold block">Jonas Donker</div>
            <div class="light block">Graf-Salm-Str. 34 | 50181 Bedburg</div>
            <div class="reachout">
              <div class="light block">Tel: <a class="block" href="tel:017664766895">0176 647 668 95</a></div>
              <div class="light block">Email: <a class="block" href="mailto:info@jonasdonker.de">info@jonasdonker.de</a>
              </div>
              <div class="light block">Web: <a class="block" href="https://jonasdonker.de">jonasdonker.de</a></div>
            </div>
          </figcaption>
          <Logo class="logo" />
        </figure>
      </div>
      <div>
        <h3>Erfahre mehr</h3>
        <p>
          Wenn du mehr über mich erfahren willst, klicke auf die Visitenkarte und schreib mir eine Email oder ruf mich
          an.
        </p>
        <p>Ich freue mich von dir zu hören.</p>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import quotes from '@/data/quotes';
import Logo from '@/components/logo.vue';

export default {
  name: 'Home',
  components: {
    Logo,
  },
  data() {
    return {
      activeQuote: {},
      turned: false,
    };
  },
  computed: {
    viewType() {
      return window.innerWidth > 414 ? 'desktop' : 'mobile';
    },
  },
  created() {
    this.getActiveQuote();
  },
  methods: {
    getActiveQuote() {
      const rand = Math.floor((Math.random() * quotes.length - 1) + 1);
      this.activeQuote = quotes[rand];
    },
    setTurned(e) {
      if (!this.turned) {
        this.turned = true;
      } else if (!e.target.classList.contains('block')) {
        this.turned = false;
      }
    },
  },
};
</script>

<style lang="scss">
.home {
  max-width: 1100px;
  margin: auto;
  padding: 1rem;

  h1 {
    font-size: 80pt;
    margin: 2rem 0;
    line-height: 1;

    @media (max-width: 768px) {
      font-size: 50pt;
    }
  }

  h2 {
    font-size: 40pt;
    margin: 0 0 2rem;

    @media (max-width: 768px) {
      font-size: 25pt;
    }
  }

  h3 {
    font-size: 18pt;
    margin: 0 0 1rem;
  }

  .v-card {
    margin-right: 2rem;

    @media (max-width: 414px) {
      margin-right: 0rem;
    }

    figure {
      max-width: 100%;
      overflow: hidden;
      background-color: #14595A;
      color: #ffffff;
      margin: 0;
      position: relative;
      border-radius: 10px;
      box-shadow: 0px 20px 20px -10px rgba(20, 89, 90, .4);
      margin: auto;
      transition: all 200ms;

      &.desktop {
        width: 500px;
        height: 300px;

        .head {
          position: absolute;
          z-index: 1;
          top: 1.5rem;
          left: 1.5rem;

          .bold {
            font-weight: bold;
            font-size: 25pt;
          }

          .light {
            font-weight: lighter;
            font-size: 15pt;
          }
        }

        .logo {
          position: absolute;
          z-index: 0;
          top: -110px;
          left: -10px;
          width: 100%;
          height: auto;
          transform: rotate(-90deg) scale(2);
        }

        .quote {
          z-index: 1;
          transform: rotate(-90deg);
          position: absolute;
          bottom: 1.5rem;
          right: 1.5rem;
          width: 130px;
          height: 130px;
          display: flex;
          flex-direction: column;
          justify-content: flex-end;

          .bold {
            font-weight: bold;
            font-size: 18pt;
          }

          .light {
            font-weight: lighter;
            font-size: 10pt;
          }
        }

        &.turned {
          width: 350px;
          height: 500px;
          background-color: #ffffff;

          .logo {
            top: 0rem;
            left: -1rem;
            width: 150px;
            transform: rotate(0deg) scale(1);
          }

          .contact {
            color: #14595A;
            position: absolute;
            bottom: 1.5rem;
            left: 1.5rem;

            .bold {
              font-weight: bold;
            }

            .light {
              font-weight: lighter;
            }

            .reachout {
              margin-top: 1.5rem;
              color: #14595A;

              a,
              a:visited,
              a:active {
                color: inherit;
                text-decoration: none;
              }
            }
          }
        }
      }

      &.mobile {
        max-width: 320px;
        width: 100%;
        height: 500px;
        margin: auto auto 2rem;

        .head {
          position: absolute;
          z-index: 1;
          top: 7rem;
          right: -3.7rem;
          transform: rotate(90deg);

          .bold {
            font-weight: bold;
            font-size: 25pt;
          }

          .light {
            font-weight: lighter;
            font-size: 15pt;
          }
        }

        .logo {
          position: absolute;
          z-index: 0;
          top: 90px;
          left: 20px;
          width: 100%;
          height: auto;
          transform: scale(3);
        }

        .quote {
          z-index: 1;
          position: absolute;
          bottom: 1.5rem;
          left: 1.5rem;
          width: 130px;
          height: 130px;
          display: flex;
          flex-direction: column;
          justify-content: flex-end;

          .bold {
            font-weight: bold;
            font-size: 18pt;
          }

          .light {
            font-weight: lighter;
            font-size: 10pt;
          }
        }

        &.turned {
          width: 350px;
          height: 500px;
          background-color: #ffffff;

          .logo {
            top: 0rem;
            left: -1rem;
            width: 150px;
            transform: rotate(0deg) scale(1);
          }

          .contact {
            color: #14595A;
            position: absolute;
            bottom: 1.5rem;
            left: 1.5rem;

            .bold {
              font-weight: bold;
            }

            .light {
              font-weight: lighter;
            }

            .reachout {
              margin-top: 1.5rem;
              color: #14595A;

              a,
              a:visited,
              a:active {
                color: inherit;
                text-decoration: none;
              }
            }
          }
        }
      }
    }
  }

  .row {
    display: flex;
    align-items: flex-end;
    flex-wrap: wrap;

    p {
      margin: 1rem 0 0;
    }

    &>* {
      min-width: 300px;
      flex: 1;
    }
  }
}
</style>
