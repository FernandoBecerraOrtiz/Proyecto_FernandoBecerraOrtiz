import { defineCollection, z } from "astro:content";

const teachers = defineCollection({
  schema: z.object({
    title: z.string(),
    image: z.string(),
    description: z.string(),
  }),
});

export const collections = {
  teachers,
};
