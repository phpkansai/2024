
const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      {
        name: 'IndexPage',
        path: '',
        component: () => import('pages/IndexPage.vue')
      },
      {
        name: 'QuestionsPage',
        path: 'questions',
        component: () => import('pages/QuestionsPage.vue')
      },
      {
        name: 'ResultPage',
        path: 'result/:uuid',
        component: () => import('pages/ResultPage.vue')
      }
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

export default routes
