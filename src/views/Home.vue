<template>
  <div class="home">
    <h1>Hi!</h1>
    <h2>Mein Name ist Jonas Donker, Freelancer für Webentwicklung und Design aus Köln.</h2>
    <div class="row">
      <a href="mailto:info@jonasdonker.de" class="v-card">
        <figure :class="viewType" figure-role="group">
          <figcaption class="head">
              <div class="bold">Jonas Donker</div>
              <div class="light">Webentwickler & Designer</div>
          </figcaption>
          <figcaption class="quote" v-if="activeQuote">
              <div class="bold">{{ activeQuote.text }}</div>
              <div class="light">- {{ activeQuote.author }}</div>
          </figcaption>
          <Logo class="logo"/>
        </figure>
      </a>
      <div>
          <h3>Erfahre mehr</h3>
          <p>
            Wenn du mehr über mich erfahren willst, klicke auf die Visitenkarte.
            Schreib mir eine Email oder ruf einfach an.
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
    figure.desktop {
      max-width: 100%;
      width: 500px;
      height: 300px;
      overflow: hidden;
      background-color: #14595A;
      color: #ffffff;
      margin: 0;
      position: relative;
      border-radius: 10px;
      box-shadow: 0px 20px 20px -10px rgba(20, 89, 90, .4);
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
    }
  }
  .row {
        display: flex;
        align-items: flex-end;
        flex-wrap: wrap;
        p {
          margin: 1rem 0 0;
        }
        & > * {
          min-width: 300px;
          flex: 1;
        }
      }
}
</style>
